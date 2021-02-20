<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Addfavorite extends Migration
{
	public function up()
	{
		$this->forge->addField([
            'favorite_id' => [
                'type' => 'INT',
                'constraint' => 5,
                'unsigned' => true,
                'auto_increment' => true,
            ],
            'user_id' => [
                'type' => 'INT',
                'constraint' => 5,
				'unsigned' => true,
            ],
            'favorite_video_id' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ],
             'favorite_video_name' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => false
            ],
            'favorite_video_url' => [
                'type' => 'TEXT',
                'null' => true,
            ],
            'favorite_video_thumbnail' => [
                'type' => 'TEXT',
                'null' => true,
            ],
            'favorite_created_at datetime default current_timestamp',
        ]);
        $this->forge->addPrimaryKey('favorite_id');
        $this->forge->createTable('favorite');
	}

	public function down()
	{
		$this->forge->dropTable('favorite');
	}
}
