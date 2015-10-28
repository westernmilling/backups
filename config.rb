# encoding: utf-8

# Backup v4.x Configuration

require 'figaro'
Figaro.application = Figaro::Application.new(:environment => 'production',
                                             :path => 'config/application.yml')
Figaro.load

Figaro.require_keys('DATABASE_HOST',
                    'DATABASE_PASS',
                    'DATABASE_USER',
                    'S3_ACCESS_KEY_ID',
                    'S3_ACCESS_KEY_SECRET',
                    'S3_BUCKET',
                    'S3_PATH',
                    'S3_REGION')

root_path '.'
