class User < ApplicationRecord
 audited
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active

  def destroy
    self.update_attribute(:status, 2)
  end
end
