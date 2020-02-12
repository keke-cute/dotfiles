(in-package :next-user)

(setf next/proxy-mode:*default-proxy*
      (make-instance 'proxy :server-address "socks5://127.0.0.1:1080"))

