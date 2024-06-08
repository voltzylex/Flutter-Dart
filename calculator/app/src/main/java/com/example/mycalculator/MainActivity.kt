package com.example.mycalculator

import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.text.isDigitsOnly
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {

    var lastNumeric: Boolean = false
    var lastDot: Boolean = false
    lateinit var tvInput: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        tvInput = findViewById(R.id.tvInput)

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

//        val button: Button = findViewById(R.id.b8)
//        button.setOnClickListener {
//            Toast.makeText(this, "Button Clicked", Toast.LENGTH_SHORT).show()
//        }
    }

    fun onDigit(view: View) {
        tvInput.append((view as Button).text)
        lastNumeric = true

        // Print the current value of the TextView to the log
        Log.d("MainActivity", "Current TextView value: ${tvInput.text} is the value is boolean ${tvInput.text.isDigitsOnly()}")
    }


    fun onClear(view: View) {
        tvInput.text = ""
        lastNumeric = false
        lastDot = false
    }

    fun onDecimalPoint(view: View) {
        if (lastNumeric && !lastDot) {
            tvInput.append(".")
            lastNumeric = false
            lastDot = true
        }
    }
    fun onOperator(view:View){
        if(lastNumeric && !isOperatorAdded(tvInput.text.toString())){
            tvInput.append((view as Button).text);
            lastNumeric = false;
            lastDot =false;
        }
    }

    private fun isOperatorAdded(value:String):Boolean{

        return if(value.startsWith("-")){
            false
        }else{
            value.contains("/")||value.contains("+")||value.contains("-")||value.contains("*")
        }
    }
}
