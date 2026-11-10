package com.example.pracazsuwakiem

import android.os.Bundle
import android.widget.Button
import android.widget.SeekBar
import android.widget.Switch
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import kotlin.random.Random
import android.widget.Toast

class MainActivity : AppCompatActivity() {

    private lateinit var guess: TextView
    private lateinit var points: TextView
    private lateinit var atts: TextView
    private lateinit var hint: TextView
    private lateinit var range: TextView

    private lateinit var seekBar: SeekBar
    private lateinit var switch1: Switch
    private lateinit var button: Button

    private var secretNumber = 0
    private var score = 0
    private var attempts = 0
    private var maxNumber = 100
    private var userGuess = 50

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val seekBar: SeekBar = findViewById(R.id.seekBar)
        val guess: TextView = findViewById(R.id.guess)
        val points: TextView = findViewById(R.id.points)
        val atts: TextView = findViewById(R.id.atts)
        val spr: Button = findViewById(R.id.button)
        val trud: Switch = findViewById(R.id.switch1)

        seekBar.setOnSeekBarChangeListener(object: SeekBar.OnSeekBarChangeListener{
            override fun onProgressChanged(
                seekBra: SeekBar?,
                progress: Int,
                fromUser: Boolean
            ) {
                var userGuess = progress
                guess.text = "$userGuess"
            }

            override fun onStartTrackingTouch(p0: SeekBar?) {

            }

            override fun onStopTrackingTouch(p0: SeekBar?) {

            }

        })
        
        switch1.setOnCheckedChangeListener { button, bool ->  }
    }
}
