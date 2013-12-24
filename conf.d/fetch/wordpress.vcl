# Requests for login, admin, sign up, preview, password protected posts, admin-ajax, etc. (WordPress & bbPress)
if (req.url ~ "(wp-login|wp-admin|wp-signup|wp-comments-post.php|wp-cron.php|admin-ajax.php|xmlrpc.php|preview=true|nocache|control.php|bb-login.php|bb-reset-password.php|register.php)" || req.http.Cookie ~ "(wp-postpass|wordpress_logged_in|comment_author_)" || req.http.X-Requested-With == "XMLHttpRequest") {
    return (hit_for_pass);
}

# Don't cache .xml files (e.g. sitemap)
if (req.url ~ "\.(xml)$") {
    set beresp.ttl = 0m;
}
