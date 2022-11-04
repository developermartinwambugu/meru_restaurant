package com.merurestaurant;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    EditText name,pass;
    Button login,register;
    DBHelper Db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        name=findViewById(R.id.txtname);
        pass=findViewById(R.id.txtpass);
        login=findViewById(R.id.btnlog);
        register=findViewById(R.id.btnreg);
        Db=new DBHelper(this);

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent=new Intent(getApplicationContext(),register.class);
                startActivity(intent);
            }
        });
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String namein=name.getText().toString();
                String passin=pass.getText().toString();
                if(namein.equals("")||passin.equals("")){
                    Toast.makeText(MainActivity.this, "Please enter the required fields", Toast.LENGTH_SHORT).show();
                }else{
                    Boolean checkuser= Db.logincheck(namein,passin);
                    if(checkuser==true){
                        Toast.makeText(MainActivity.this, "Sign in successful", Toast.LENGTH_SHORT).show();
                        Intent intent=new Intent(getApplicationContext(),dashboard.class);
                        startActivity(intent);
                    } else{
                        Toast.makeText(MainActivity.this, "Login Failed", Toast.LENGTH_SHORT).show();
                    }
                }
            }
        });
    }
}