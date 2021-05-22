FactoryBot.define do                                       
  factory :record_place do                               
    add = Gimei.address                                    
  pos_code    {'123' + '-' + '4567'}                  
  area_id     {Faker::Number.within(range: 1..47) }                    
  city        {add}                 
  address     {add}           
  phone_num   {'1112223333'}
  token       {Faker::Alphanumeric.alphanumeric(number: 15, min_alpha: 3)}
  building    {add}
  end                
end                   
