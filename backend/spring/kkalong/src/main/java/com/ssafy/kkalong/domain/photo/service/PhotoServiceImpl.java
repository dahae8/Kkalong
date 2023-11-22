package com.ssafy.kkalong.domain.photo.service;

import com.ssafy.kkalong.domain.member.entity.Member;
import com.ssafy.kkalong.domain.photo.entity.Photo;
import com.ssafy.kkalong.domain.photo.repository.PhotoRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class PhotoServiceImpl implements PhotoService{
    @Autowired
    private PhotoRepository photoRepository;

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Photo> getPhotoList(Member member){
        return photoRepository.findAllByMemberMemberSeqAndIsPhotoDeleted(member.getMemberSeq(), false);
    }

    @Override
    public Photo getPhotoBySeq(int photoSeq){
        return photoRepository.findByPhotoSeqAndIsPhotoDeleted(photoSeq, false);
    }

    @Override
    @Transactional
    public boolean deletePhotoBySeq(Photo photo){
        Optional<Object> foundPhoto = photoRepository.findByPhotoSeq(photo.getPhotoSeq());

        if (Objects.requireNonNull(foundPhoto).isPresent()) {
            // 엔티티의 상태를 변경
            photo.setPhotoDeleted(true);
            return true;
        }
        return false;
    }

    @Override
    public Photo savePhoto(Photo photo) {
        return photoRepository.save(photo);
    }

    @Override
    @Transactional
    public void updatePhotoImgMasking(int photoSeq) {
        // 엔티티를 조회
        Photo photo = entityManager.find(Photo.class, photoSeq);

        if (photo != null) {
            photo.setPhotoImgMasking(true);
        }
    }
}
