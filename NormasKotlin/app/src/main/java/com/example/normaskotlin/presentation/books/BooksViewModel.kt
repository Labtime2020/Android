package com.example.normaskotlin.presentation.books

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.normaskotlin.data.model.Book


//Não receber qualquer referencia da activity ou fragment dentro do ViewModel
//ViewModel deve ser independente do framework
class BooksViewModel : ViewModel() {
    //Forma que passamos dados para a Activity, é atravez do LiveData
    //Val -> Recebe o valor somente uma unica vez e depois é static
    val bookLiveData: MutableLiveData<List<Book>> = MutableLiveData()

    fun getBooks() {
        bookLiveData.value = createFakeBooks()
    }

    fun createFakeBooks() : List<Book>{
        return listOf<Book>(
            Book("title 1", "author 1"),
            Book("title 2", "author 2"),
            Book("title 3", "author 3")
        )
    }
}