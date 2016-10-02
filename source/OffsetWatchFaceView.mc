using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

class OffsetWatchFaceView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Get the current time and format it correctly
        var clockTime = Sys.getClockTime();
        var hours = clockTime.hour;
        var minutes = clockTime.min;
        if (!Sys.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (App.getApp().getProperty("UseMilitaryFormat")) {
                hours = hours.format("%02d");
            }
        }
        
        // Update the view
        var hourLabel = View.findDrawableById("HourLabel");
        var minuteLabel = View.findDrawableById("MinuteLabel");
        
        var hourText = Lang.format("$1$", [hours]);
        var minuteText = Lang.format("$1$", [clockTime.min.format("%02d")]);

        hourLabel.setColor(App.getApp().getProperty("ForegroundColor"));
        hourLabel.setText(hourText);

        minuteLabel.setColor(App.getApp().getProperty("ForegroundColor"));
        minuteLabel.setText(minuteText);
        
        var level = View.findDrawableById("level");
        level.setPercent(0.4);

        var level2 = View.findDrawableById("level2");
        level2.setPercent(0.8);

        var level3 = View.findDrawableById("level3");
        level3.setPercent(0.2);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
       
        /*
		var data = new Rez.Drawables.Data();
		data.draw( dc );
		*/
		
		/*
		var moveBar = new ProgressBar({
			:locX=>10,
			:locY=>10,
			:width=>50,
			:height=>50,
			:color=>Gfx.COLOR_ORANGE
		});
		moveBar.setPercent(0.5);
		moveBar.draw( dc );
		*/
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
