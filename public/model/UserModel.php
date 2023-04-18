<?php
require_once PROJECT_ROOT_PATH . "/Model/Database.php";

class UserModel extends Database
{
    /**
     * @throws Exception
     */
    public function getUsers($page, $limit): array
    {
        return $this->select("CALL GetAllUsers(?, ?);", ["ii", $page, $limit]);
    }
}