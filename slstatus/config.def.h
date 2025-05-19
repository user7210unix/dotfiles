const unsigned int interval = 1000;

static const char unknown_str[] = "n/a";

#define MAXLEN 2048

static const struct arg args[] = {
    /* function format               argument */

    /*    { netspeed_rx, "󰤨  %sB/S   ", "wlp0s20f3" }, */

    {battery_perc, "󰁹 %s%% ", "BAT0"},
    {run_command, "   %s%%  ", "pamixer --get-volume"},
    { datetime,             "󰥔 %s",                "%H:%M   %a %d/%m " },   
}; 

