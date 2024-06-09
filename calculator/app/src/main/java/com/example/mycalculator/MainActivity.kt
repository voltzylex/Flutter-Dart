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


    fun onEqual(view: View) {
        // If the last input is a number only, solution can be found.
        if (lastNumeric) {
            // Read the textView value
            var value = tvInput.text.toString()
            var prefix = ""
            try {

                // Here if the value starts with '-' then we will separate it and perform the calculation with value.
                if (value.startsWith("-")) {
                    prefix = "-"
                    value = value.substring(1);
                }

                // If the inputValue contains the Division operator
                if (value.contains("/")) {
                    // Will split the inputValue using Division operator
                    val splitedValue = value.split("/")

                    var one = splitedValue[0] // Value One
                    val two = splitedValue[1] // Value Two

                    if (!prefix.isEmpty()) { // If the prefix is not empty then we will append it with first value i.e one.
                        one = prefix + one
                    }

                    /*Here as the value one and two will be calculated based on the operator and
                    if the result contains the zero after decimal point will remove it.
                    And display the result to TextView*/
                    tvInput.text = removeZeroAfterDot((one.toDouble() / two.toDouble()).toString())
                } else if (value.contains("*")) {
                    // If the inputValue contains the Multiplication operator
                    // Will split the inputValue using Multiplication operator
                    val splitedValue = value.split("*")

                    var one = splitedValue[0] // Value One
                    val two = splitedValue[1] // Value Two

                    if (!prefix.isEmpty()) { // If the prefix is not empty then we will append it with first value i.e one.
                        one = prefix + one
                    }

                    /*Here as the value one and two will be calculated based on the operator and
                    if the result contains the zero after decimal point will remove it.
                    And display the result to TextView*/
                    tvInput.text = removeZeroAfterDot((one.toDouble() * two.toDouble()).toString())
                } else if (value.contains("-")) {

                    // If the inputValue contains the Subtraction operator
                    // Will split the inputValue using Subtraction operator
                    val splitedValue = value.split("-")

                    var one = splitedValue[0] // Value One
                    val two = splitedValue[1] // Value Two

                    if (!prefix.isEmpty()) { // If the prefix is not empty then we will append it with first value i.e one.
                        one = prefix + one
                    }

                    /*Here as the value one and two will be calculated based on the operator and
                    if the result contains the zero after decimal point will remove it.
                    And display the result to TextView*/
                    tvInput.text = removeZeroAfterDot((one.toDouble() - two.toDouble()).toString())
                } else if (value.contains("+")) {
                    // If the inputValue contains the Addition operator
                    // Will split the inputValue using Addition operator
                    val splitedValue = value.split("+")

                    var one = splitedValue[0] // Value One
                    val two = splitedValue[1] // Value Two

                    if (!prefix.isEmpty()) { // If the prefix is not empty then we will append it with first value i.e one.
                        one = prefix + one
                    }

                    /*Here as the value one and two will be calculated based on the operator and
                    if the result contains the zero after decimal point will remove it.
                    And display the result to TextView*/
                    tvInput.text = removeZeroAfterDot((one.toDouble() + two.toDouble()).toString())
                }
            } catch (e: ArithmeticException) {
                e.printStackTrace()
            }
        }
    }

    /**
     * It is used to check whether any of the operator is used or not.
     */
    private fun isOperatorAdded(value: String): Boolean {

        /**
         * Here first we will check that if the value starts with "-" then will ignore it.
         * As it is the result value and perform further calculation.
         */

        return if (value.startsWith("-")) {
            false
        } else {
            (value.contains("/")
                    || value.contains("*")
                    || value.contains("-")
                    || value.contains("+"))
        }
    }

    /**
     * Remove the zero after decimal point
     */
    private fun removeZeroAfterDot(result: String): String {

        var value = result

        if (result.contains(".0")) {
            value = result.substring(0, result.length - 2)
        }

        return value
    }
}