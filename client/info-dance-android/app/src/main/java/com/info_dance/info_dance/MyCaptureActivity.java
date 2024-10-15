package com.info_dance.info_dance;

import android.os.Bundle;


import com.info_dance.info_dance.databinding.ActivityMyCaptureBinding;

import com.journeyapps.barcodescanner.CaptureActivity;
import com.journeyapps.barcodescanner.DecoratedBarcodeView;


public class MyCaptureActivity extends CaptureActivity {
    ActivityMyCaptureBinding binding;
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        binding=ActivityMyCaptureBinding.inflate(getLayoutInflater());
//        setContentView(binding.getRoot());
//
//
//    }
        @Override
        protected DecoratedBarcodeView initializeContent() {
            setContentView(R.layout.activity_my_capture);
            return findViewById(R.id.zxing_barcode_scanner);
        }




}