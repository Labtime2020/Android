package com.example.normaskotlin.presentation.books

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.normaskotlin.R
import com.example.normaskotlin.data.model.Book
import kotlinx.android.synthetic.main.item_book.view.*

//Adapter é o responsavel por fazer o binding do ArrayList para o RecycleView
class BooksAdapter(
    private val books: List<Book>
): RecyclerView.Adapter<BooksAdapter.BooksViewHolder>() {

    //Criar o ViewHolder com o Layout, no caso o RecyclerView
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): BooksViewHolder {
        val itemView = LayoutInflater.from(parent.context).inflate(R.layout.item_book, parent, false)
        return BooksViewHolder(itemView)
    }

    //Return the count items in list of Books
    override fun getItemCount() = books.count()

    //Faz a ligação de cada componente da lista com o RecyclerView
    override fun onBindViewHolder(viewHolder: BooksViewHolder, position: Int) {
        viewHolder.bindView(books[position])
    }

    class BooksViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        private val title = itemView.textTitle
        private val author = itemView.textAuthor

        fun bindView(book: Book) {
            title.text = book.title
            author.text = book.author
        }
    }
}