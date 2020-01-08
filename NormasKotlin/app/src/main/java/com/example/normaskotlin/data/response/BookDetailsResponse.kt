package com.example.normaskotlin.data.response

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class BookDetailsResponse (
    @Json(name = "title")
    val title: String,
    @Json(name = "author")
    val author: String,
    @Json(name = "description")
    val description: String
)

//Quando o nome da variavel é o mesmo que vai receber do JSON, ele faz automatico