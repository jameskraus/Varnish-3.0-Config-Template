# Drop any cookies sent to Wordpress.
# Except for previews and backend.
if (req.url !~ "wp-(login|admin|signup)" && req.url !~ "preview=true" || req.url ~ "admin-ajax.php") {

    # Keep cookies if the post is password protected.
    if (req.http.Cookie !~ "wp-postpass"){
        unset req.http.cookie;
    }
}

# Anything else left?
if (!req.http.cookie) {
    unset req.http.cookie;
}

# Try a cache-lookup
return (lookup);
