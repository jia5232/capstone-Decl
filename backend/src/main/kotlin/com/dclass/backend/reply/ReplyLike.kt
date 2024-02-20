package com.dclass.backend.reply

import jakarta.persistence.Column
import jakarta.persistence.Embeddable

@Embeddable
class ReplyLike(
    @Column(nullable = false)
    val userId: Long,

    @Column(nullable = false)
    val replyId: Long
)