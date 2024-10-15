package com.info_dance.info_dance;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import com.info_dance.info_dance.databinding.ActivityMainBinding;


public class MainActivity extends AppCompatActivity {

    // Activity绑定
    ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // activity绑定并且填充获取到的布局填充器
        binding =ActivityMainBinding.inflate(getLayoutInflater());
        // 将binding获取到的内容设置到当前视图上
        setContentView(binding.getRoot());
        // bottom_nav 绑定选择事件
        replaceFragment(new HomeFragment());
        binding.homeBottomNavView.setOnItemSelectedListener(item->{
            int itemId=item.getItemId();
            if(R.id.home==itemId){
                replaceFragment(new HomeFragment());
            }
            if(R.id.message==itemId){
                replaceFragment(new MessageFragment());
            }
            if(R.id.my==itemId){
                replaceFragment(new MyFragment());
            }
            return true;
        });


    }
    // 替换Fragment
    private  void  replaceFragment(Fragment fragment){
        FragmentManager fragmentManager = getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
        fragmentTransaction.replace(R.id.homeBottomNavContentViewContainer,fragment);
        fragmentTransaction.commit();
    }
}