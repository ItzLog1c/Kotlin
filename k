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

Losowa liczba
o Po uruchomieniu aplikacji losowana jest liczba target z zakresu 0–100
(włącznie).
2. Wybór strzału
o SeekBar: min=0, max=100.
o Obok/poniżej TextView pokazuje: „Twój typ: X”.
3. Sprawdzanie
o Button z napisem „Sprawdź”.
o Po kliknięciu:
▪ Jeśli guess == target → komunikat „Trafione! +10 pkt”, punkty += 10,
gra automatycznie losuje nowy target, resetuje licznik prób i
poprzedni dystans (patrz pkt 4).
▪ Jeśli nie trafiono → wyświetl:
▪ „Cieplej” jeśli |guess−target| < |poprzedni_guess−target|
▪ „Zimniej” jeśli |guess−target| ≥ |poprzedni_guess−target|
▪ Zawsze aktualizuj TextView z punktami i liczbą prób.
4. Pamiętanie ostatniego dystansu
o Przechowuj lastDistance (dla pierwszej próby traktuj brak porównania i
wyświetl np. „Spróbuj!”).
5. Tryb trudny (Switch)
o Switch podpisany „Tryb trudny”.
o Gdy OFF (domyślnie): brak limitu prób, za pudło 0 pkt, tylko podpowiedzi.
o Gdy ON:
▪ Startowo 7 prób na jedną liczbę. Każde „Sprawdź” zmniejsza próby
o 1.
▪ Gdy liczba prób spadnie do 0 i nie trafiono → „Koniec rundy: −5 pkt”,
punkty −= 5, losuj nowy target, resetuj próby na 7, wyczyść
lastDistance.
▪ Dodatkowa zasada: jeżeli w momencie kliknięcia SeekBar > 90,
nalicz karę −2 pkt (komunikat w TextView), niezależnie od
trafienia/nie. (To świadome nawiązanie do poprzedniej aplikacji, ale
inny efekt niż zerowanie).
6. Zerowanie gry
o Długie naciśnięcie przycisku „Sprawdź” (long click) resetuje całą grę:
punkty=0, próby (jeśli trudny)=7, losuje się nowy target, czyści komunikaty.
(Jeśli nie chcecie long clicka — można dodać drugi Button „Reset”, ale
nie jest wymagany).
7. Jeden ekran / jedno Activity
o Całość w MainActivity (Kotlin), layout np. activity_main.xml.
