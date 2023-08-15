#!/bin/bash
export WP_SUBDIR_PATH='/var/www/html/wordpress'
# WordPressのインストール
#=======================
wp core install \
--url="http://localhost:8080/wordpress" \
--title="myproject" \
--admin_user='wordpress' \
--admin_password='wordpress' \
--admin_email='info@example.com' \
--allow-root \
--path=${WP_SUBDIR_PATH}

# 一般設定
# =======================
# キャッチフレーズを空にする
wp option update blogdescription --allow-root '' --path=${WP_SUBDIR_PATH}
# 日本語化
wp language core install --allow-root --activate ja --path=${WP_SUBDIR_PATH}
# タイムゾーンと日時表記
wp option update --allow-root timezone_string 'Asia/Tokyo' --path=${WP_SUBDIR_PATH}
wp option update --allow-root date_format 'Y-m-d' --path=${WP_SUBDIR_PATH}
wp option update --allow-root time_format 'H:i' --path=${WP_SUBDIR_PATH}


# テーマ
# =======================
# wp theme delete --allow-root twentysixteen --path=${WP_SUBDIR_PATH}
# wp theme delete --allow-root twentyseventeen --path=${WP_SUBDIR_PATH}
# wp theme delete --allow-root twentynineteen --path=${WP_SUBDIR_PATH}
# wp theme delete --allow-root twentytwenty --path=${WP_SUBDIR_PATH}

# プラグイン
# =======================
# プラグインの削除 (不要な初期プラグインを削除)
wp plugin delete hello.php --allow-root --path=${WP_SUBDIR_PATH}
wp plugin delete akismet --allow-root --path=${WP_SUBDIR_PATH}

# プラグインのインストール (必要に応じてコメントアウトを外す)
wp plugin install wp-multibyte-patch --activate --allow-root --path=${WP_SUBDIR_PATH}
wp plugin install all-in-one-wp-migration --activate --allow-root --path=${WP_SUBDIR_PATH}
# wp plugin install backwpup --activate --allow-root --path=${WP_SUBDIR_PATH}
# wp plugin install siteguard --activate --allow-root --path=${WP_SUBDIR_PATH}
# wp plugin install contact-form-7 --activate --allow-root --path=${WP_SUBDIR_PATH}
# wp plugin install wp-mail-smtp --activate --allow-root --path=${WP_SUBDIR_PATH}
# wp plugin install all-in-one-seo-pack --activate --allow-root --path=${WP_SUBDIR_PATH}
# wp plugin install broken-link-checker --activate --allow-root --path=${WP_SUBDIR_PATH}
# wp plugin install addquicktag --activate --allow-root --path=${WP_SUBDIR_PATH}

# 固定ページ
# =======================
# wp post create --allow-root --post_type=page --post_title='About' --path=${WP_SUBDIR_PATH}

# パーマリンク更新
wp option update permalink_structure /%category%/%post_id%/ --allow-root --path=${WP_SUBDIR_PATH}

# インストール用シェルスクリプトへ実行権限を付与する
# chmod +x /tmp/wp-install.sh

# 所有者：グループを変更←最後に実行すること！
chown -R www-data:www-data /var/www/html
