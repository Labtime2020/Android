package com.example.normaskotlin.data

import com.example.normaskotlin.data.response.BookBodyResponse
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

//Interface responsavel por mapear todos os endpoints da API
interface NYTServices {

    @GET("lists.json")
    fun getBooks(
        @Query("api-key") apiKey: String = "Qa37YxuaRGc9KmQs2WdmCpwn8yd6MIKe",
        @Query("list") list: String = "hardcover-fiction"
    ): Call<BookBodyResponse>
}