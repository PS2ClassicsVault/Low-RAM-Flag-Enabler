SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=false
LATESTARTSERVICE=false

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

# Set what you want to display when installing your module

print_modname() {
  ui_print "*******************************"
  ui_print "       Low RAM Flag Enabler      "
  ui_print "      By Cyberdev| Ver: 1.0      " 
  ui_print "*******************************"
  ui_print "    WARNING(READ CAREFULLY):   "
  ui_print "can cause a bootloop if your device"
  ui_print "doesn't support the low ram flag natively."
  ui_print "*********************************"
  ui_print "Be sure to have a Anti Bootloop module installed"
  ui_print "to rescue you if this happens!"
}

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644
}