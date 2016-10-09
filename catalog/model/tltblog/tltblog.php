<?php
class ModelTltBlogTltBlog extends Model {
	public function getTltBlog($tltblog_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE b.tltblog_id = '" . (int)$tltblog_id . "' AND bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b.status = '1' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		return $query->row;
	}

	public function getTltBlogs($limit = 0, $where_tags = array()) {
		$where = '';
		
		if ($where_tags) {
			$i = 1;
			
			foreach ($where_tags as $where_tag) {
				if ($i < count($where_tags)) {
					$where .= $where_tag . ', ';
				} else {
					$where .= $where_tag;
				}
				$i++;
			}
		}

		if ($where) {
			if ($limit == 0) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_tag btt ON (b.tltblog_id = btt.tltblog_id)  WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' AND btt.tlttag_id IN (" . $where .") GROUP BY b.tltblog_id ORDER BY b.sort_order, LCASE(bd.title) ASC");
			} else {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_tag btt ON (b.tltblog_id = btt.tltblog_id)  WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' AND btt.tlttag_id IN (" . $where .") GROUP BY b.tltblog_id ORDER BY b.sort_order, LCASE(bd.title) ASC LIMIT " . (int)$limit);
			}
		} else {
			if ($limit == 0) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' ORDER BY b.sort_order, LCASE(bd.title) ASC");
			} else {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' ORDER BY b.sort_order, LCASE(bd.title) ASC LIMIT " . (int)$limit);
			}
		}

		return $query->rows;
	}

	public function getTltBlogsBottom() {
		$blogs = $this->cache->get('tltblog.bottomblogs.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		
		if (!$blogs) {			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE b.bottom = '1' AND bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' ORDER BY b.sort_order, LCASE(bd.title) ASC");
			$blogs = $query->rows;
			
			$this->cache->set('tltblog.bottomblogs.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $blogs);

		}

		return $blogs;
	}

	public function getRandomTltBlogs($limit = 0, $where_tags = array()) {
		$where = '';
		
		if ($where_tags) {
			$i = 1;
			
			foreach ($where_tags as $where_tag) {
				if ($i < count($where_tags)) {
					$where .= $where_tag . ', ';
				} else {
					$where .= $where_tag;
				}
				$i++;
			}
		}
		
		if ($where) {
			if ($limit == 0) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_tag btt ON (b.tltblog_id = btt.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' AND btt.tlttag_id IN (" . $where .") GROUP BY b.tltblog_id ORDER BY b.sort_order, LCASE(bd.title) ASC");
			} else {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_tag btt ON (b.tltblog_id = btt.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' AND btt.tlttag_id IN (" . $where .") GROUP BY b.tltblog_id ORDER BY RAND() LIMIT " . (int)$limit);
			}
		} else {
			if ($limit == 0) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' ORDER BY b.sort_order, LCASE(bd.title) ASC");
			} else {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' ORDER BY RAND() LIMIT " . (int)$limit);
			}
		}

		return $query->rows;
	}

	public function getTltBlogRelated($tltblog_id) {
		$query = $this->db->query("SELECT related_id FROM " . DB_PREFIX . "tltblog_related br LEFT JOIN " . DB_PREFIX . "product p ON (br.related_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE br.tltblog_id = '" . (int)$tltblog_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.sort_order");

		return $query->rows;
	}

	public function getTltBlogLayoutId($tltblog_id) {
		$query = $this->db->query("SELECT layout_id FROM " . DB_PREFIX . "tltblog_to_layout WHERE tltblog_id = '" . (int)$tltblog_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function countTltBlogs($where_tags = array()) {
		if (!$where_tags) {
			$count = $this->cache->get('tltblog.count.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		
			if (!$count) {			
				$query = $this->db->query("SELECT COUNT(DISTINCT b.tltblog_id) AS total FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1'");

				$count = $query->row['total'];
			
				$this->cache->set('tltblog.count.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $count);
			}
		} else {
			$where = '';
			$i = 1;
			
			foreach ($where_tags as $where_tag) {
				if ($i < count($where_tags)) {
					$where .= $where_tag . ', ';
				} else {
					$where .= $where_tag;
				}
				$i++;
			}
				
			$query = $this->db->query("SELECT COUNT(DISTINCT b.tltblog_id) AS total FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_tag btt ON (b.tltblog_id = btt.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' AND btt.tlttag_id IN (" . $where .")");

			$count = $query->row['total'];
		}
		
		return $count;
	}

	public function getTltBlogsForTag($tlttag_id) {
		$blogs = $this->cache->get('tltblog.blogsfortag.' . (int)$tlttag_id . '.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$blogs) {
			$blogs = array();
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_tag b2t ON (b.tltblog_id = b2t.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE b2t.tlttag_id = '" . (int)$tlttag_id . "' AND bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1' ORDER BY b.sort_order, LCASE(bd.title) ASC");
			
			$blogs = $query->rows;
			$this->cache->set('tltblog.blogsfortag.' . (int)$tlttag_id . '.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $blogs);

		}

		return $blogs;
	}

	public function getTltTag($tlttag_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "tlttag t LEFT JOIN " . DB_PREFIX . "tlttag_description td ON (t.tlttag_id = td.tlttag_id) LEFT JOIN " . DB_PREFIX . "tlttag_to_store t2s ON (t.tlttag_id = t2s.tlttag_id) WHERE t.tlttag_id = '" . (int)$tlttag_id . "' AND td.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t.status = '1' AND t2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		return $query->row;
	}

	public function getAllTltTags() {
		$tags = $this->cache->get('tltblog.tlttag.all.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$tags) {
			$tags = array();
			
			$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "tlttag t LEFT JOIN " . DB_PREFIX . "tlttag_description td ON (t.tlttag_id = td.tlttag_id) LEFT JOIN " . DB_PREFIX . "tlttag_to_store t2s ON (t.tlttag_id = t2s.tlttag_id) WHERE t.tlttag_id = '" . (int)$tlttag_id . "' AND td.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t.status = '1' AND t2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
			$tags = $query->rows;
			$this->cache->set('tltblog.tlttag.all.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $tags);

		}

		return $tags;
	}

	/* Get only tags, which are linked to any blog entry */
	
	public function getTltTags() {
		$tags = $this->cache->get('tltblog.tlttag.tags.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$tags) {
			$tags = array();
			
			$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "tlttag t LEFT JOIN " . DB_PREFIX . "tlttag_description td ON (t.tlttag_id = td.tlttag_id) LEFT JOIN " . DB_PREFIX . "tlttag_to_store t2s ON (t.tlttag_id = t2s.tlttag_id) WHERE t.tlttag_id IN (SELECT tlttag_id FROM " . DB_PREFIX . "tltblog_to_tag) AND t.status = '1' AND td.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY t.sort_order, LCASE(td.title) ASC");
			
			$tags = $query->rows;
			$this->cache->set('tltblog.tlttag.tags.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $tags);

		}

		return $tags;
	}

	public function getTltTagsForBlog($tltblog_id) {
		$query = $this->db->query("SELECT t.tlttag_id AS tlttag_id, td.title AS title FROM  " . DB_PREFIX . "tltblog_to_tag b2t LEFT JOIN  " . DB_PREFIX . "tlttag t ON (b2t.tlttag_id = t.tlttag_id) LEFT JOIN  " . DB_PREFIX . "tlttag_description td ON (t.tlttag_id = td.tlttag_id) LEFT JOIN  " . DB_PREFIX . "tlttag_to_store t2s ON (t.tlttag_id = t2s.tlttag_id) WHERE b2t.tltblog_id = '" . (int)$tltblog_id . "' AND t.status = '1' AND td.language_id = '" . (int)$this->config->get('config_language_id') . "' AND t2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY t.sort_order, LCASE(td.title) ASC");

		return $query->rows;
	}

	public function getTotalTltTags() {
		$count = $this->cache->get('tltblog.tlttag.count.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$count) {			
			$query = $this->db->query("SELECT COUNT(DISTINCT b.tltblog_id) AS total FROM " . DB_PREFIX . "tltblog b LEFT JOIN " . DB_PREFIX . "tltblog_description bd ON (b.tltblog_id = bd.tltblog_id) LEFT JOIN " . DB_PREFIX . "tltblog_to_store b2s ON (b.tltblog_id = b2s.tltblog_id) WHERE bd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND b2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND b.status = '1'");
			
			$count = $query->row['total'];
			
			$this->cache->set('tltblog.tlttag.count.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $count);
		}
		
		return $count;
	}
}
