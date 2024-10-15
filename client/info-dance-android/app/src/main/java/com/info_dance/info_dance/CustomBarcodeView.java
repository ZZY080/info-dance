package com.info_dance.info_dance;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.util.Log;

import com.journeyapps.barcodescanner.DecoratedBarcodeView;

public class CustomBarcodeView extends DecoratedBarcodeView {

    private Paint paint;

    public CustomBarcodeView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
        // 初始化逻辑
        Log.d("CustomBarcodeView", "CustomBarcodeView");
    }

    private void init() {
        paint = new Paint();
        paint.setColor(Color.GREEN); // 设置扫描框颜色
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(500); // 设置边框宽度
        // 初始化逻辑
        Log.d("CustomBarcodeView", "Initialized");
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Log.d("CustomBarcodeView", "onDraw called");
        drawCustomFrame(canvas);
    }

    private void drawCustomFrame(Canvas canvas) {
        int width = getWidth();
        int height = getHeight();

        // 定义扫描框的位置（可以根据需要调整）
        int left = (int) (width * 0.1);
        int top = (int) (height * 0.3);
        int right = (int) (width * 0.5);
        int bottom = (int) (height * 0.5);

        // 绘制扫描框
        canvas.drawRect(left, top, right, bottom, paint);
    }
}
