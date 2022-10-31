package sm.wareco.android.wareco_2;

import android.content.Intent;
import android.content.IntentFilter;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;

public class MainActivity extends FlutterActivity {


    public static final String DW_ACTION = "com.dwexample.ACTION";
    public static final String DATAWEDGE_INTENT_KEY_SOURCE = "com.symbol.datawedge.source";
    public static final String DATAWEDGE_INTENT_KEY_LABEL_TYPE = "com.symbol.datawedge.label_type";
    public static final String DATAWEDGE_INTENT_KEY_DATA = "com.symbol.datawedge.data_string";


    private static final String EVENT_CHANNEL = "yarkinov.abduraimbek/barcode_channel";


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);


        MyBarcodeReceiver myBarcodeReceiver = new MyBarcodeReceiver();

        IntentFilter filter = new IntentFilter(DW_ACTION);
        filter.addCategory(Intent.CATEGORY_DEFAULT);
        this.registerReceiver(myBarcodeReceiver, filter);


        new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), EVENT_CHANNEL).setStreamHandler(myBarcodeReceiver);

    }
}
