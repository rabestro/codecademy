package com.codecademy.simplecalculator;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final EditText firstNumber = findViewById(R.id.number1);
        final EditText secondNumber = findViewById(R.id.number2);
        final RadioGroup operators = findViewById(R.id.operators);
        final RadioButton add = findViewById(R.id.add);
        final RadioButton subtract = findViewById(R.id.subtract);
        final Button equals = findViewById(R.id.equals);
        final TextView result = findViewById(R.id.result);

        equals.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final int a = Integer.parseInt(firstNumber.getText().toString());
                final int b = Integer.parseInt(secondNumber.getText().toString());
                final int op = operators.getCheckedRadioButtonId();
                final int answer;

                if (op == add.getId()) {
                    answer = a + b;
                } else {
                    answer = a - b;
                }

                result.setText(Integer.toString(answer));
            }
        });
    }
}