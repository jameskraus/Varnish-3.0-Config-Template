# Drop any cookies Wordpress tries to send back to the client.
if (req.url !~ "wp-(login|admin|signup)" && req.url !~ "preview=true" || req.url ~ "admin-ajax.php") {
    # Keep cookies if the post is password protected.
    if (req.http.Cookie !~ "wp-postpass"){
        unset beresp.http.set-cookie;
    }
}
