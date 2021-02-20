<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Adduser extends Migration
{
	public function up()
    {
        $this->forge->addField([
            'user_id' => [
                'type' => 'INT',
                'constraint' => 5,
                'unsigned' => true,
                'auto_increment' => true,
            ],
            'user_name' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => false
            ],
            'user_email' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => false,
                'unique' => true
            ],
            'user_level' => [
                'type'           => 'ENUM',
                'constraint'     => ['admin', 'user'],
                'default'        => 'user',
            ],
            'user_password' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => false,
                'unique' => true
            ],
            'user_updated_at' => [
                'type' => 'datetime',
                'null' => true,
            ],
            'user_created_at datetime default current_timestamp',
        ]);
        $this->forge->addPrimaryKey('user_id');
        $this->forge->createTable('user');
    }

    public function down()
    {
        $this->forge->dropTable('user');
    }
}
