package com.ssafy.kkalong.domain.photo.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;

public class PhotoMixRequestRes {
    @Schema(description = "반환 URL")
    private String url;
    @Schema(description = "반환 메세지")
    private String msg;

}
