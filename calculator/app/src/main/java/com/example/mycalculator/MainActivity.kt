package com.example.mycalculator

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets


        }
        val  button: Button = findViewById(R.id.b8);
        button.setOnClickListener{
            Toast.makeText(this, "Button Clicked", Toast.LENGTH_SHORT).show()
        }

//        fun onDigit(){
//            val tvInput: TextView = findViewById(R.id.tvInput)
//            tvInput.setText("1");
//            Toast.makeText(this,"this is button 7",Toast.LENGTH_SHORT,).show();
//        }

    }

    fun onDigit(view: View) {
//        Toast.makeText(this,"this is button 7",Toast.LENGTH_SHORT,).show();
        val tvInput: TextView = findViewById(R.id.tvInput)
        tvInput.append((view as Button).text);
    }
}