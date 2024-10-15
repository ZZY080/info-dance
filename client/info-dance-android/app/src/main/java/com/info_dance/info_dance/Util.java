package com.info_dance.info_dance;

import android.graphics.Bitmap;
import android.util.Log;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.journeyapps.barcodescanner.BarcodeEncoder;

public class Util {

    // 生成条形码
    public static Bitmap generateBarCode(String text){
        try{
            // BarcodeFormat.QR_CODE 生产二维码  BarcodeFormat.CODE_128
            MultiFormatWriter writer =new MultiFormatWriter();
            BitMatrix matrix =writer.encode(text, BarcodeFormat.CODE_128,350,350);
            BarcodeEncoder encoder =new BarcodeEncoder();
            return  encoder.createBitmap(matrix);
        }catch (WriterException e){
            Log.d("Generate BarCode error:",e.toString());
            return null;
        }
    }

    // 生成二维码
    public  static  Bitmap generateQrCode(String text){
        try{
            // BarcodeFormat.QR_CODE 生产二维码  BarcodeFormat.CODE_128
            MultiFormatWriter writer =new MultiFormatWriter();
            BitMatrix matrix =writer.encode(text, BarcodeFormat.QR_CODE,350,350);
            BarcodeEncoder encoder =new BarcodeEncoder();
            return  encoder.createBitmap(matrix);
        }catch (WriterException e){
            Log.d("Generate BarCode error:",e.toString());
            return null;
        }
    }
}
