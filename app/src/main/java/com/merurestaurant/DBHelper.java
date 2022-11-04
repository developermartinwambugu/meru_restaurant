package com.merurestaurant;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

public class DBHelper extends SQLiteOpenHelper {
    public static final String name="Login.db";

    public DBHelper(Context context) {
        super(context, name, null, 1);
    }

    @Override
    public void onCreate(SQLiteDatabase mydb) {
        mydb.execSQL("create Table users(name Text primary key,email Text,password Text)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase mydb, int i, int i1) {
        mydb.execSQL("drop Table if exists users");
    }

    public Boolean insertdata(String name,String email, String password){
        SQLiteDatabase MyDb=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put("name",name);
        contentValues.put("email",email);
        contentValues.put("password",password);
        Long results=MyDb.insert("users",null,contentValues);
        if(results == -1) return false; else return true;
    }
    public Boolean checkuser(String name){
        SQLiteDatabase MyDb=this.getWritableDatabase();
        Cursor cursor=MyDb.rawQuery("select * from users where name = ?",new String[]{name});
        if(cursor.getCount()>=1) return true; else return false;
    }
    public Boolean logincheck(String name, String pass){
        SQLiteDatabase MyDb=this.getWritableDatabase();
        Cursor cursor=MyDb.rawQuery("Select * from users where name=? and password =?",new String[]{name,pass});
        if (cursor.getCount()>=1)return true; else return false;
    }
}
