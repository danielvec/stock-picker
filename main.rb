def stock_picker(price_array)
    #create an array with all possible price gains/losses and their respective prices
    stock_array = []
    for i in 0...price_array.length
        for j in i+1...price_array.length
            stock_array << price_array[j] - price_array[i]
            stock_array << i
            stock_array << j
        end
    end
    #sort to find best possible gain
    gain_loss_array = []
    for i in 0...stock_array.length
        if i % 3 === 0
            gain_loss_array << stock_array[i]
        end
    end
    sorted_gains = gain_loss_array.sort { |a, b| b <=> a }
    best_gain = sorted_gains[0]
    #find index of best gain in gain_loss_array
    best_gain_index = gain_loss_array.index(best_gain)
    #output best day to buy and sell
    best_days = []
    best_days << stock_array[best_gain_index*3+1]
    best_days << stock_array[best_gain_index*3+2]
    puts best_days
end
stock_picker([17,3,6,9,15,8,6,1,10])