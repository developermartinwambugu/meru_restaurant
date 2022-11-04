package com.merurestaurant;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class register extends AppCompatActivity {
    EditText name,email,password;
    Button login,register;
    DBHelper Db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        name = findViewById(R.id.txtnamer);
        email = findViewById(R.id.txtemail);
        password = findViewById(R.id.txtpassr);
        login = findViewById(R.id.btnlogr);
        register = findViewById(R.id.btnregr);
        Db = new DBHelper(this);


        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                startActivity(intent);
            }
        });

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String namein = name.getText().toString();
                String emailin = email.getText().toString();
                String pass = password.getText().toString();
                if (namein.equals("") || emailin.equals("") || pass.equals("")) {
                    Toast.makeText(register.this, "Please Enter all fields", Toast.LENGTH_SHORT).show();
                } else {
                    Boolean checkuser = Db.checkuser(namein);
                    if (checkuser == false) {
                        Boolean insert = Db.insertdata(namein, emailin, pass);
                        if (insert == true) {
                            Toast.makeText(register.this, "Registration Successful", Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                            startActivity(intent);
                        } else {
                            Toast.makeText(register.this, "Registration Failed", Toast.LENGTH_SHORT).show();
                        }
                    }else{
                        Toast.makeText(register.this, "User Already Exists", Toast.LENGTH_SHORT).show();
                    }
                }
            }
        });
    }
}