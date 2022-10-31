package sm.wareco.android.wareco_2;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import io.flutter.plugin.common.EventChannel;

public class MyBarcodeReceiver extends BroadcastReceiver implements EventChannel.StreamHandler {


    EventChannel.EventSink barcodeSink;


    private void onReceiveMethod(Intent intent) {
        String decodedSource = intent.getStringExtra(MainActivity.DATAWEDGE_INTENT_KEY_SOURCE);
        String decodedData = intent.getStringExtra(MainActivity.DATAWEDGE_INTENT_KEY_DATA);
        String decodedLabelType = intent.getStringExtra(MainActivity.DATAWEDGE_INTENT_KEY_LABEL_TYPE);

        if (decodedSource != null && decodedData != null && decodedLabelType != null && barcodeSink != null) {
            barcodeSink.success(decodedData);
        }
    }


    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            String action = intent.getAction();

            if (action.equals(MainActivity.DW_ACTION)) {
                onReceiveMethod(intent);
            }
        } catch (Exception e) {
            Log.d("Barcode scan error", e.toString());
        }
    }

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        barcodeSink = events;
    }

    @Override
    public void onCancel(Object arguments) {
        barcodeSink = null;
    }
}
