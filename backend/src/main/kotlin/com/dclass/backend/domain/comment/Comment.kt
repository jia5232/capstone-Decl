package com.dclass.backend.domain.comment

import com.dclass.support.domain.BaseEntity
import jakarta.persistence.Column
import jakarta.persistence.Embedded
import jakarta.persistence.Entity
import org.hibernate.annotations.SQLDelete
import org.hibernate.annotations.SQLRestriction

@SQLDelete(sql = "update comment set deleted = true where id = ?")
@SQLRestriction("deleted = false")
@Entity
class Comment(
    @Column(nullable = false)
    val userId: Long,

    @Column(nullable = false)
    val postId: Long,

    content: String = "",

    commentLikes: CommentLikes = CommentLikes(),

    id: Long = 0L
) : BaseEntity(id) {

    @Column(nullable = false)
    private var deleted: Boolean = false

    @Column(nullable = false, length = 255)
    var content: String = content
        private set

    @Embedded
    var commentLikes: CommentLikes = commentLikes
        private set

    val likeCount: Int
        get() = commentLikes.count

    fun likedBy(userId: Long) =
        commentLikes.findUserById(userId)
}