# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141012185134) do

  create_table "attachments", force: true do |t|
    t.string   "type"
    t.string   "file_name"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "email_id"
  end

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number"
    t.string   "address"
    t.integer  "mailbox_id"
    t.integer  "friend_id"
  end

  create_table "emails", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reciever_mailbox_id"
    t.integer  "sender_mailbox_id"
    t.string   "subject"
    t.integer  "max",                 default: 4
    t.string   "tag"
  end

  create_table "emails_mailboxes", force: true do |t|
    t.integer  "email_id"
    t.integer  "mailbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.integer  "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailboxes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "number_of_mails_send", default: 0
  end

end
