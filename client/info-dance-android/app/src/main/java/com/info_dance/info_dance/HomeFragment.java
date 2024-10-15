package com.info_dance.info_dance;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;

import androidx.annotation.ColorInt;
import androidx.core.content.ContextCompat;
import androidx.core.widget.TextViewCompat;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;


/**
 * A simple {@link Fragment} subclass.
 * Use the {@link HomeFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class HomeFragment extends Fragment {

    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";
    private RecyclerView recyclerView;
    private MyAdapter adapter;
    private List<String> itemList;


    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    public HomeFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment HomeFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static HomeFragment newInstance(String param1, String param2) {
        HomeFragment fragment = new HomeFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }


    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view=inflater.inflate(R.layout.fragment_home,container,false);
        // 扫描二维码按钮
//        Button scanBtn=view.findViewById(R.id.my_scan_code);
        // 为扫描二维码按钮绑定点击事件
//        scanBtn.setOnClickListener(item->{
//            Intent intent = new Intent(getActivity(), QrcodeScanActivity.class);
//            startActivity(intent);
//        });

        // 获取父容器ViewGroup 例如LinearLayout
        ViewGroup parentLayout = view.findViewById(R.id.parentLayout);
        // 遍历所有子元素并添加点击监听器
        for(int i=0;i<parentLayout.getChildCount();i++){
            View child = parentLayout.getChildAt(i);
            // 为每个子元素添加点击事件
            child.setOnClickListener(v->{
                // 每次点击清除所有子元素的选中状态
                clearSelection(parentLayout);
                if(v instanceof TextView){
                    // 设置当前点击的子元素为选中状态
                    TextView tv= ((TextView) v);
                    tv.setBackground(ContextCompat.getDrawable(v.getContext(), R.drawable.home_top_bar_item_active_round));
                    tv.setTextColor(Color.WHITE);
                }
            });
        }

        // 初始化RecyclerView
        recyclerView = view.findViewById(R.id.home_tab_bar_item_content_recycler_view);
        // 设置GridLayoutManager,指定两列
        recyclerView.setLayoutManager(new GridLayoutManager(getContext(),2));
        // 初始化数据
        itemList=new ArrayList<>();
        for(int i=1;i<40;i++){
            itemList.add(""+i);
        }
        // 设置适配器
        adapter = new MyAdapter(itemList);
        recyclerView.setAdapter(adapter);


        // Inflate the layout for this fragment
        return view;
    }


    // 清除所有子元素的选中状态
    private void clearSelection(ViewGroup parentLayout){
        for(int i=0;i<parentLayout.getChildCount();i++){
            View child = parentLayout.getChildAt(i);

            // 判断当前子视图是否是TextView或其子类
            if(child instanceof TextView) {
                // 将文字颜色设置为默认颜色
                TextView tv= ((TextView) child);
                tv.setBackgroundColor(Color.WHITE);
                tv.setBackground(ContextCompat.getDrawable(child.getContext(), R.drawable.home_top_bar_item_round));
                tv.setTextColor(Color.BLACK);

            }

        }
    }

}