package com.dclass.backend.ui.api

import com.dclass.backend.application.ReplyService
import com.dclass.backend.application.dto.CreateReplyRequest
import com.dclass.backend.application.dto.ReplyRequest
import com.dclass.backend.application.dto.ReplyResponse
import com.dclass.backend.domain.user.User
import com.dclass.backend.security.LoginUser
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.responses.ApiResponse
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@Tag(name = "Reply", description = "대댓글 관련 API 명세")
@RequestMapping("/api/replies")
@RestController
class ReplyController(
    private val replyService: ReplyService
) {

    @Operation(summary = "대댓글 생성 API", description = "댓글에 대댓글을 생성합니다.")
    @ApiResponse(responseCode = "200", description = "대댓글 생성 성공")
    @PostMapping("/{commentId}")
    fun createReply(
        @LoginUser user: User,
        @PathVariable commentId: Long,
        @RequestBody request: ReplyRequest
    ): ResponseEntity<ApiResponses<ReplyResponse>> {
        val reply = replyService.create(user.id, CreateReplyRequest(commentId, request.content))
        return ResponseEntity.ok(ApiResponses.success(reply))
    }

}