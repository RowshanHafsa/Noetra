-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2026 at 07:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studyhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `bookmark_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `bookmarked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `community_discussions`
--

CREATE TABLE `community_discussions` (
  `discussion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `post_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `reset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `progress_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `progress_percent` int(11) NOT NULL DEFAULT 0,
  `status` enum('Not Started','In Progress','Completed') NOT NULL DEFAULT 'Not Started',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `quiz_title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` enum('A','B','C','D') NOT NULL,
  `is_correct` tinyint(1) DEFAULT 0,
  `answered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `question_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_option` enum('A','B','C','D') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `resource_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `resource_type` enum('YouTube','Google','PDF Book','Lecture Notes','Documentation','GitHub Repo','Article','Practice Website') NOT NULL,
  `resource_title` varchar(255) NOT NULL,
  `resource_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource_ratings`
--

CREATE TABLE `resource_ratings` (
  `rating_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Table structure for table `result_tags`
--

CREATE TABLE `result_tags` (
  `tag_id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_results`
--

CREATE TABLE `saved_results` (
  `result_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `roadmap` longtext DEFAULT NULL,
  `ai_notes` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `difficulty` enum('Beginner','Intermediate','Advanced') NOT NULL DEFAULT 'Beginner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

CREATE TABLE `search_history` (
  `search_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','admin') NOT NULL DEFAULT 'student',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `interest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `interest_tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`resource_id`),
  ADD KEY `fk_bookmark_resource` (`resource_id`);

--
-- Indexes for table `community_discussions`
--
ALTER TABLE `community_discussions`
  ADD PRIMARY KEY (`discussion_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_discussion_result` (`result_id`),
  ADD KEY `fk_discussion_user` (`user_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `fk_note_user` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`reset_id`),
  ADD KEY `fk_reset_user` (`user_id`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`progress_id`),
  ADD KEY `fk_progress_user` (`user_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resource_id`),
  ADD KEY `fk_resource_result` (`result_id`);

--
-- Indexes for table `resource_ratings`
--
ALTER TABLE `resource_ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `unique_user_resource_rating` (`resource_id`,`user_id`),
  ADD KEY `fk_rating_user` (`user_id`);

--
-- Indexes for table `result_tags`
--
ALTER TABLE `result_tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `fk_tag_result` (`result_id`);

--
-- Indexes for table `saved_results`
--
ALTER TABLE `saved_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `fk_result_user` (`user_id`);

--
-- Indexes for table `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `fk_search_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD PRIMARY KEY (`interest_id`),
  ADD UNIQUE KEY `unique_user_interest` (`user_id`,`interest_tag`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_discussions`
--
ALTER TABLE `community_discussions`
  MODIFY `discussion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_ratings`
--
ALTER TABLE `resource_ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result_tags`
--
ALTER TABLE `result_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_results`
--
ALTER TABLE `saved_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_history`
--
ALTER TABLE `search_history`
  MODIFY `search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `interest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `fk_bookmark_resource` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bookmark_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `community_discussions`
--
ALTER TABLE `community_discussions`
  ADD CONSTRAINT `community_discussions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `fk_discussion_result` FOREIGN KEY (`result_id`) REFERENCES `saved_results` (`result_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_discussion_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_note_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `fk_reset_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `fk_progress_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `quiz_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`question_id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`) ON DELETE CASCADE;

--
-- Constraints for table `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `fk_resource_result` FOREIGN KEY (`result_id`) REFERENCES `saved_results` (`result_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource_ratings`
--
ALTER TABLE `resource_ratings`
  ADD CONSTRAINT `fk_rating_resource` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rating_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result_tags`
--
ALTER TABLE `result_tags`
  ADD CONSTRAINT `fk_tag_result` FOREIGN KEY (`result_id`) REFERENCES `saved_results` (`result_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saved_results`
--
ALTER TABLE `saved_results`
  ADD CONSTRAINT `fk_result_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `search_history`
--
ALTER TABLE `search_history`
  ADD CONSTRAINT `fk_search_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD CONSTRAINT `fk_interest_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
