module movectf::sample {
    use sui::event;
    use sui::tx_context::{Self, TxContext};

    struct Flag has copy, drop {
        user: address,
        flag: bool
    }

    // The player needs to call get_flag() and trigger a Flag event to win.
    public entry fun get_flag(ctx: &mut TxContext) {
        event::emit(Flag {
            user: tx_context::sender(ctx),
            flag: true
        })
    }
}

