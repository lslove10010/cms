# 使用官方PHP镜像作为基础镜像
FROM php:7.4-apache
USER 10014
# 安装所需的PHP扩展和其他依赖项
RUN apt-get update && apt-get install -y \

# 启用Apache重写模块
RUN a2enmod rewrite



# 下载苹果CMS V10的最新官方原版源码
RUN curl -o maccms10.zip -SL https://github.com/magicblack/maccms10/archive/refs/tags/V2024.1000.4030.zip \
    && unzip maccms10.zip -d /var/www/html/ \
    && rm maccms10.zip

# 设置文件权限
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# 暴露80端口
EXPOSE 80

# 启动Apache服务器
CMD ["apache2-foreground"]
