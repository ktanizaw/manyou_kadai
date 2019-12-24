class User < ApplicationRecord
  before_destroy :must_not_destroy_admin

  validates :name,
    presence: true, presence: {message: "入力してください！"}
    # uniqueness: true, length: { maximum: 30 }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true, presence: {message: "入力してください！"},
    # uniqueness: true,
    format: { with: VALID_EMAIL_REGEX },
    length: { maximum: 255 }

    has_secure_password
    validates :password,
    presence: true, length: { minimum: 6 }

    has_many :tasks, foreign_key: :user_id, dependent: :destroy
    has_many :labels, foreign_key: :user_id, dependent: :destroy
    private

    def must_not_destroy_admin
      if self.admin? && User.where(admin: :true).count == 1
        throw :abort
        flash[:danger] = "これ以上管理者は削除できません"
      end
    end
  end
