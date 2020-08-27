require 'sqlite3'
require 'singleton'
require 'byebug'

class QuestionsDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :fname, :lname, :id

    def self.find_by_id(id)
        user_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        # debugger
        user_tmp.map { |el| User.new(el) } unless user_tmp.empty?
    end

    def self.find_by_name(fname, lname)
        user_tmp = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        # user_tmp might contain more than one users

        user_tmp.map { |el| User.new(el) } unless user_tmp.empty?
    end



    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        Question.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_user_id(id)
    end

    def followed_questions
        QuestionF.followed_questions_for_user_id(id)
    end
end

class Question
    attr_accessor :title, :body, :id, :user_id

    def self.find_by_id(id)
        question_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        question_tmp.map { |el| Question.new(el) } unless question_tmp.empty?
    end

    def self.find_by_author_id(id)
        question_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                user_id = ?
        SQL
        question_tmp.map { |el| Question.new(el) } unless question_tmp.empty?
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end

    def author
        user_id
    end

    def replies
        Reply.find_by_question_id(id)
    end

    def followers
        QuestionF.followers_for_question_id(id)
    end
end

class Reply
    attr_accessor :body, :id, :user_id, :question_id, :parent_id

    def self.find_by_id(id)
        reply_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        reply_tmp.map { |el| Reply.new(el) } unless reply_tmp.empty?
    end

    def self.find_by_user_id(id)
        reply_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        reply_tmp.map { |el| Reply.new(el) } unless reply_tmp.empty?
    end

    def self.find_by_question_id(id)
        reply_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        reply_tmp.map { |el| Reply.new(el) } unless reply_tmp.empty?
    end

    def self.find_by_parent_id(id)
        reply_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_id = ?
        SQL
        reply_tmp.map { |el| Reply.new(el) } unless reply_tmp.empty?
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @question_id = options['question_id']
        @user_id = options['user_id']
        @parent_id = options['parent_id']
    end

    def author
        User.find_by_id(user_id)
    end

    def parent_reply
        Reply.find_by_id(parent_id)
    end

    def child_replies
        Reply.find_by_parent_id(id)
    end
end

class QuestionF
    attr_accessor :question_id, :id, :user_id

    def self.find_by_id(id)
        question_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        question_tmp.map { |el| QuestionF.new(el) } unless question_tmp.empty?
    end
    
    def self.followers_for_question_id(question_id)
        user_tmp = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                users.*
            FROM
                users
            JOIN 
                question_follows AS qf ON qf.user_id = users.id 
            WHERE
                qf.question_id = ?
        SQL
        user_tmp.map { |el| User.new(el) } unless user_tmp.empty?
    end

    def self.followed_questions_for_user_id(user_id)
        question_tmp = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
            SELECT
                questions.*
            FROM
                questions
            JOIN 
                question_follows AS qf ON qf.question_id = questions.id 
            WHERE
                qf.question_id = ?
        SQL
        question_tmp.map { |el| Question.new(el) } unless question_tmp.empty?
    end

    def self.most_followed_questions(n)
        question_tmp = QuestionsDBConnection.instance.execute(<<-SQL, n)
            SELECT
                questions.*, COUNT(*)
            FROM
                questions
            JOIN 
                question_follows AS qf ON qf.question_id = questions.id 
            GROUP BY
                qf.question_id 
            ORDER BY
                COUNT(*) DESC LIMIT ?
        SQL
        question_tmp.map { |el| Question.new(el) } unless question_tmp.empty?
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end

class QuestionL
    attr_accessor :question_id, :id, :user_id

    def self.find_by_id(id)
        question_tmp = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        question_tmp.map { |el| QuestionL.new(el) } unless question_tmp.empty?
    end

    def self.likers_for_question_id(question_id)
        user_tmp = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                users.*
            FROM
                users
            JOIN 
                question_likes AS ql ON ql.user_id = users.id 
            WHERE
                ql.question_id = ?
        SQL
        user_tmp.map { |el| User.new(el) } unless user_tmp.empty?
    end

    def self.num_likes_for_question_id(question_id)
        user_tmp = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                Count(*) AS num_likes
            FROM
                users
            JOIN 
                question_likes AS ql ON ql.user_id = users.id 
            WHERE
                ql.question_id = ?
        SQL
        user_tmp[0]['num_likes']
    end

    def self.liked_questions_for_user_id(user_id)
        question_tmp = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
            SELECT
                questions.*
            FROM
                questions
            JOIN 
                question_likes AS lf ON lf.question_id = questions.id 
            WHERE
                lf.question_id = ?
        SQL
        question_tmp.map { |el| Question.new(el) } unless question_tmp.empty?
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end

if $PROGRAM_NAME == __FILE__
    user1 = User.find_by_name('Khal', 'Drogo')
    reply1 = Reply.find_by_id(1)[0]
    reply1 = Reply.find_by_id(1)[0]
    p User.find_by_id(1)
    p Question.find_by_id(1)
    p QuestionF.find_by_id(1)
    p QuestionF.find_by_id(3)
    p QuestionL.find_by_id(1)
    p Reply.find_by_id(1)
    p User.find_by_id(4)
    puts
    puts

end
