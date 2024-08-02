# add settings link to plugin
if ( $file == plugin_basename(dirname(__FILE__) . '/wp_guard.php') ) {
    $in = '<a href="options-general.php?page=wp_guard_settings">' . __('Settings') . '</a>';
    array_unshift($links, $in);
}

return $links;