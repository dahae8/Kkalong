# 전처리 총괄 서버

from fastapi import FastAPI
from fastapi import HTTPException
from decouple import config
from U2Net.u2net_test import main as u2test
from RemBg.rb import remove_bg            #rembg import
from request_body import rb
import pymysql
import boto3
import os


app = FastAPI()

# DB 설정
connection = pymysql.connect(
    host=config('MYSQL_HOST'),
    user=config('MYSQL_USER'),
    password=config('MYSQL_PASSWORD'),
    database=config('MYSQL_DB'),
    charset='utf-8'
)

# DB 커서 생성
cursor = connection.cursor()

# AWS 자격 증명 및 S3 클라이언트 생성
s3 = boto3.client('s3',
                  aws_access_key_id=config('AWS_ACCESS_KEY'),
                  aws_secret_access_key=config('AWS_SECRET_KEY'),
                  region_name=config('AWS_REGION')  # AWS 리전 설정
                  )
bucket_name = config('AWS_BUCKET')


@app.get("/u2net")
def run_u2net(body: rb):
    # 1. 요청 받은 파일의 존재 여부를 DB에서 확인한다.
    # 2. 존재할 경우, 해당 파일을 S3서버에서 다운로드 받는다
    # 3. 다운을 받았으면, u2test를 돌린다.
    # 4. 모델이 끝났으면 파일을 업로드 한다
    # 5. DB를 업데이트 한다.
    # 6. 다운 받은 파일과 결과물을 지운다.
    print("run_u2net called")
    print(body)
    # 1. 요청한 계정에 요청받은 파일명이 존재하는지 DB에서 확인한다
    sql = ("select photo_img_name, member_seq"
           "from member join photo using member_seq"
           "where member_id = %s and photo_img_name = %s")
    cursor.execute(sql, (rb.member_id, rb.photo_img_name))

    # 2. 없다면 에러 보내고, 있다면 해당 파일을 다운 받는다.
    results = cursor.fetchall()
    if (len(results) == 0):
        return {"result": "실패", "stdout": "검색결과 없음"}
    member_seq = results[0][1]
    s3.download_file(bucket_name, r"photo/" + rb.photo_img_name + ".png", r"./examples/" + rb.photo_img_name + ".png")

    # 3. 해당 파일에 대해서 openpose를 돌린다.
    command = r".\bin\OpenPoseDemo.exe --image_dir examples --hand --write_json output_jsons --write_images output_images --disable_blending"

    try:
        # 외부 exe 파일 실행
        process = subprocess.Popen(['powershell', '-command', command], stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE, text=True)

        # 실행이 완료될 때까지 대기
        process.wait()

        # 실행 결과를 반환
        stdout, stderr = process.communicate()
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

    # 4. 작업이 끝나면 파일을 S3서버에 올린다
    try:
        s3.upload_file(r"./output_images/" + rb.photo_img_name + "_rendered.png", bucket_name,
                       "openpose/img/" + rb.photo_img_name + ".png")
        s3.upload_file(r"./output_jsons/" + rb.photo_img_name + "_keypoints.json", bucket_name,
                       "openpose/json/" + rb.photo_img_name + ".json")
    except boto3.exceptions.NoCredentialsError:
        return "AWS 자격 증명을 찾을 수 없습니다. 자격 증명을 설정하세요."
    except boto3.exceptions.EndpointConnectionError:
        return "S3 엔드포인트에 연결할 수 없습니다. 리전을 확인하세요."

    # 5. DB에 작업이 되어 있음으로 업데이트 한다.
    sql = ("update photo"
           "set photo_img_openpose = 1, photo_json_openpose = 1"
           "where photo_img_name = %s and member_seq = %s")
    cursor.execute(sql, (rb.photo_img_name, member_seq))

    # 6. 다운 받았던 파일과 결과 파일을 삭제한다.
    try:
        os.remove(r"./examples" + rb.photo_img_name + ".jpg")
        os.remove(r"./output_images" + rb.photo_img_name + "_rendered.png")
        os.remove(r"./output_jsons" + rb.photo_img_name + "_keypoints.json")
    except FileNotFoundError:
        print(f"파일이 존재하지 않습니다")
    except Exception as e:
        print(f"파일 삭제 중 오류 발생: {e}")

    # 7. 호출자에게 완료를 반환한다.
    return {"result": "성공", "stdout": stdout}


@app.get("/rembg/cloth")    #옷 누끼딸꺼 (원본사진)
def run_rembg_for_cloth():
    print()


@app.get("/rembg/photo")    #사람사진 누끼 
def run_rembg_for_photo():
    print()


@app.get("/cihp")  #사람부위별 마스킹
def run_cihp():
    print()





