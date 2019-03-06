#include "cav_ranges\defines.hpp"

class cav_ranges
{
    class ranges
    {
        class rifleRange
        {
            title = "Rifle Range"; // String representation of the range
            type = "popup"; // kind of targets used (popup, units)
            activation = "time"; // how the range is advanced (time, triggers, none)
            tag = "rr"; // prefix of the range object names
            targetCount = 8; // target count per lane
            laneCount = 6; // count of lanes on the range
            qualTiers[] = {38,30,23}; // score thresholds for qualifications
            instructorActions = true; // whether to add player scroll wheel menu for instructors
            controlObjectActions = true; // whether to add control actions to the range control object
            civTargetCount = 0; // targets that if hit, show a message (planned to reduce score)
            civTargetsAlwaysUp = true; // whether to raise all civ targets the whole time or only when specified in the sequence
            hasHitIndicators = true; // whether the range has hit indicator objects
            customTexture = "cav_ranges\data\target.paa";
            sequence[] = {
                {"Load one 20 round magazine",5,"Reload"},
                {"Assume a prone position and scan your lane",3,"Prone2"},
                {"Range is hot!",1,"RangeIsHot"},
                {"Range is hot!",0,"FD_Course_Active_F",0},
                {{1},5},
                {{2},5},
                {{6},5},
                {{3},5},
                {{8},5},
                {{4},5},
                {{7},5},
                {{2},5},
                {{1},5},
                {{5},5},
                {{2,4},8},
                {{1,5},8},
                {{7,3},8},
                {{3,6},8},
                {{2,5},8},
                {"Reload one 20 round magazine",5,"Reload"},
                {"Assume a prone position and scan your lane",3,"Prone1"},
                {"Range is hot!",1,"RangeIsHot"},
                {"Range is hot!",0,"FD_Course_Active_F",0},
                {{5},5},
                {{2},5},
                {{7},5},
                {{1},5},
                {{8},5},
                {{3},5},
                {{4},5},
                {{6},5},
                {{3},5},
                {{2},5},
                {"Assume a kneeling position and scan your lane",3,"Kneel"},
                {"Range is hot!",1,"RangeIsHot"},
                {{1},5},
                {{3},5},
                {{4},5},
                {{2},5},
                {{3},5},
                {{2},5},
                {{4},5},
                {{1},5},
                {{3},5},
                {{2},5},
                {"Cease Fire!",3,"CeaseFire1"},
                {"Standby for final score...",1,"StandbyScore"},
                {"Range complete.",0}
            };
            //class EventHandlers
            //{
            //    rangeActivated = "";
            //    rangeDeactivated = "";
            //    sequenceEventStarted = "";
            //    sequenceEventComplete = "";
            //    sequenceComplete = "";
            //    targetHit = "";
            //    targetActivating = "";
            //    targetActivated = "";
            //    targetDeactivating = "";
            //    targetDeactivated = "";
            //    triggerActivated = "";
            //    civTargetHit = "";
            //};
        };
        class rifleRange
        {
            title = "Grenade Range"; // String representation of the range
            type = "popup"; // kind of targets used (popup, units)
            activation = "time"; // how the range is advanced (time, triggers, none)
            tag = "rr"; // prefix of the range object names
            targetCount = 8; // target count per lane
            laneCount = 4; // count of lanes on the range
            qualTiers[] = {8,6,5}; // score thresholds for qualifications
            instructorActions = true; // whether to add player scroll wheel menu for instructors
            controlObjectActions = false; // whether to add control actions to the range control object
            civTargetCount = true; // targets that if hit, show a message (planned to reduce score)
            civTargetsAlwaysUp = true; // whether to raise all civ targets the whole time or only when specified in the sequence
            hasHitIndicators = true; // whether the range has hit indicator objects
            customTexture = "cav_ranges\data\target.paa";
            sequence[] = {
                {"Ready your grenades",5},
                {"Range is hot!",1},
                {{1},15},
                {{2,3},15},
                {{4},15},
                {{5,6},15},
                {{7,8},15},
                {"Range complete.",0}
            };
        };
    };
};
