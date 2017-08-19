class Task < ApplicationRecord

# I coded data model task.rb    
    
def self.searching(search)
  if search      
    where('lower(name) LIKE ? OR
                  lower(complete) LIKE ? OR
                  lower(due_date) LIKE ? OR
                  lower(term) LIKE ?', 
                  "%#{search}%".downcase, 
                  "%#{search}%".downcase,
                  "%#{search}%".downcase,
                  "%#{search}%".downcase).order('created_at DESC')
  else
    order('created_at ASC')
  end
end
        
end
