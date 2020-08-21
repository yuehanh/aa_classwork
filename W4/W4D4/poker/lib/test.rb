hsh = {2=> 3, 5=> 2, 6=>2}
p hsh.sort do |a,b|
    if hsh[b] <=> hsh[a] == 0
        b <=> a
    else
        hsh[b] <=> hsh[a]
    end
end