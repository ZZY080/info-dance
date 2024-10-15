package com.info_dance.info_dance;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;

import androidx.activity.result.ActivityResultLauncher;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;
import com.info_dance.info_dance.databinding.ActivityQrcodeScanBinding;
import com.journeyapps.barcodescanner.ScanContract;
import com.journeyapps.barcodescanner.ScanOptions;


public class QrcodeScanActivity extends AppCompatActivity {

    // 获取绑定类实例(简化获取视图的操作)
    ActivityQrcodeScanBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //
        binding = ActivityQrcodeScanBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        // 为按钮绑定点击事件
        binding.btnScan.setOnClickListener(item->{

            scanCode();
        });
    }
   private void scanCode(){

        // ScanOptions 是一个配置类,用于设置扫描操作的参数,你可以通过这个类来定义扫描时的行为和外观
       ScanOptions options = new ScanOptions();
       // 设置提示信息：setPrompt 方法用于设置扫描界面上的提示信息,在这个例子中,提示用户通过调高音量来开启闪光灯
       options.setPrompt("Volumn up to flash on");
       // 启用音效：setBeepEnabled() 方法用于设置扫描成功时是否发出声音,如果设置为true,在成功扫描条形码或二维码后,设备将发出滴声
       options.setBeepEnabled(true);
       // 锁定屏幕方向：setOrientationLocked()方法用于锁定扫描界面的屏幕方向,如果设置为true,屏幕方向将被锁定为当前方向,用户无法通过旋转设备来改变方向
       options.setOrientationLocked(true);
       // 设置自定义扫描活动：setCaptureActivity 方法允许你指定一个自定义的捕获活动。在这里，MyCaptureActivity.class 是一个扩展自扫描活动的自定义类，可以用于定制扫描界面的行为和样式
       options.setCaptureActivity(MyCaptureActivity.class);
       barLaucher.launch(options);
    }



    ActivityResultLauncher<ScanOptions> barLaucher=registerForActivityResult(new ScanContract(), result->{
        if(result.getContents()!=null){
            AlertDialog.Builder builder=new AlertDialog.Builder(QrcodeScanActivity.this);
            builder.setTitle("Result:");
            builder.setMessage(result.getContents());
            builder.setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.dismiss();
                }
            }).show();
        }
    });
}