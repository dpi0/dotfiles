#!/usr/bin/env bash

xfconf-query -c thunar -l -v | while read -r property value; do
  echo "xfconf-query -c thunar -p \"$property\" -s \"$value\""
done

xfconf-query -c thunar -p "/default-view" -s "ThunarDetailsView"
xfconf-query -c thunar -p "/last-details-view-column-widths" -s "50,50,248,50,50,299,78,50,971,82,125,79,50,154"
xfconf-query -c thunar -p "/last-details-view-visible-columns" -s "THUNAR_COLUMN_DATE_MODIFIED,THUNAR_COLUMN_GROUP,THUNAR_COLUMN_NAME,THUNAR_COLUMN_OWNER,THUNAR_COLUMN_PERMISSIONS,THUNAR_COLUMN_SIZE,THUNAR_COLUMN_TYPE"
xfconf-query -c thunar -p "/last-details-view-zoom-level" -s "THUNAR_ZOOM_LEVEL_75_PERCENT"
xfconf-query -c thunar -p "/last-focused-tab-left" -s "0"
xfconf-query -c thunar -p "/last-focused-tab-right" -s "0"
xfconf-query -c thunar -p "/last-icon-view-zoom-level" -s "THUNAR_ZOOM_LEVEL_300_PERCENT"
xfconf-query -c thunar -p "/last-restore-tabs" -s "true"
xfconf-query -c thunar -p "/last-separator-position" -s "170"
xfconf-query -c thunar -p "/last-tabs-left" -s "[file:///home/dpi0]"
xfconf-query -c thunar -p "/last-view" -s "ThunarDetailsView"
xfconf-query -c thunar -p "/last-window-maximized" -s "true"
xfconf-query -c thunar -p "/misc-date-style" -s "THUNAR_DATE_STYLE_LONG"
xfconf-query -c thunar -p "/misc-directory-specific-settings" -s "true"
xfconf-query -c thunar -p "/misc-folders-first" -s "false"
xfconf-query -c thunar -p "/misc-full-path-in-tab-title" -s "true"
xfconf-query -c thunar -p "/misc-middle-click-in-tab" -s "true"
xfconf-query -c thunar -p "/misc-open-new-window-as-tab" -s "true"
xfconf-query -c thunar -p "/misc-single-click" -s "false"
xfconf-query -c thunar -p "/misc-symbolic-icons-in-sidepane" -s "false"
xfconf-query -c thunar -p "/misc-text-beside-icons" -s "false"

echo "✅ Thunar settings applied."
