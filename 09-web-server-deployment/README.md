# 09 - Nginx Web Server Deployment

## Objective

Install Nginx on Ubuntu and publish a simple static HTML website.

## 1. Install Nginx

```bash
sudo apt update
sudo apt install -y nginx
sudo systemctl enable --now nginx
sudo systemctl status nginx --no-pager
```

## 2. Create website content

```bash
sudo mkdir -p /var/www/linux-project
sudo tee /var/www/linux-project/index.html > /dev/null <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Linux Server Project</title>
</head>
<body>
  <h1>Linux Server Successfully Deployed!</h1>
  <p>Hosted on Ubuntu Server using Microsoft Azure.</p>
  <p>Configured with SSH, UFW and Nginx.</p>
</body>
</html>
HTML
```

Set safe read permissions:

```bash
sudo chown -R root:root /var/www/linux-project
sudo find /var/www/linux-project -type d -exec chmod 755 {} \;
sudo find /var/www/linux-project -type f -exec chmod 644 {} \;
```

## 3. Configure an Nginx server block

```bash
sudo tee /etc/nginx/sites-available/linux-project > /dev/null <<'NGINX'
server {
    listen 80;
    listen [::]:80;

    server_name _;

    root /var/www/linux-project;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
NGINX
```

Enable it and remove the default site symlink if it conflicts:

```bash
sudo ln -s /etc/nginx/sites-available/linux-project /etc/nginx/sites-enabled/linux-project
sudo nginx -t
sudo systemctl reload nginx
```

If the symlink already exists, inspect it rather than creating a duplicate. The default site may remain enabled, but ensure the intended server block is selected for your test request.

## 4. Test locally

```bash
curl -I http://localhost
curl http://localhost
sudo ss -tulnp | grep ':80'
```

Expected HTTP status: `200 OK`.

## 5. Test from your computer

Open:

```text
http://YOUR_PUBLIC_IP
```

Or run:

```bash
curl -I http://YOUR_PUBLIC_IP
```

Make sure Azure NSG and UFW permit inbound TCP 80. Do not expose a service until you intend it to be publicly reachable.

## 6. HTTPS and domain names

For a real public website:
- Point a DNS A record to the VM's public IPv4 address (or use the appropriate IPv6 record).
- Configure TLS/HTTPS using a trusted certificate.
- Keep certificates and private keys secure.
- Consider a managed load balancer or reverse proxy for production.
- Do not treat this simple lab configuration as a production architecture.

## Troubleshooting

```bash
sudo nginx -t
sudo systemctl status nginx
sudo journalctl -u nginx -n 50
sudo tail -n 50 /var/log/nginx/error.log
sudo ss -tulnp
```

## Completion checklist

- [ ] Nginx installed and enabled.
- [ ] Custom HTML page created.
- [ ] Nginx server block enabled.
- [ ] `nginx -t` passes.
- [ ] Local HTTP test returns 200.
- [ ] External HTTP test succeeds.
