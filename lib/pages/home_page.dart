To refactor the given Flutter code, I will make improvements to make the code cleaner and more organized. Here's the refactored code:

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/constant.dart';
import 'package:pet_adoption_app/default_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildJoinCommunityContainer(),
          _buildCategoryContainer(context),
          _buildGridOptions(),
          _buildNearbyVeterinaryContainer(context),
          _buildDoctorList(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Hi Dear\n',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Good Morning!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  SliverList _buildJoinCommunityContainer() {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primaryColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 3,
                offset: Offset(0, 10),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('images/community-bg.png'),
              alignment: Alignment.centerRight,
            ),
          ),
          height: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Join The \nCommunity',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Text(
                  'Join now',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  SliverList _buildCategoryContainer(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'See All',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  SliverList _buildGridOptions() {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        SizedBox(
          height: 120,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.horizontal,
            children: [
              _buildGridOption(
                image: 'images/vet.png',
                title: 'Vet',
                isSelected: true,
                onTap: () {},
              ),
              _buildGridOption(
                image: 'images/Grooming.png',
                title: 'Grooming',
                isSelected: false,
                onTap: () {},
              ),
              _buildGridOption(
                image: 'images/food.png',
                title: 'Food',
                isSelected: false,
                onTap: () {},
              ),
              _buildGridOption(
                image: 'images/playing.png',
                title: 'Playing',
                isSelected: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildGridOption({
    required String image,
    required String title,
    bool isSelected = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 4.3,
              height: 85,
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : secondryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(
                image,
                height: 50,
              ),
            ),
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverList _buildNearbyVeterinaryContainer(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 5,
          ),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nearby Veterinary',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'See All',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  SliverList _buildDoctorList() {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        ListView(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(0),
          children: const [
            DrListContainer(),
            DrListContainer(),
            DrListContainer(),
            DrListContainer(),
            DrListContainer(),
          ],
        ),
      ]),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBar        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        // Handle bottom navigation item taps here
      },
    );
  }
}

class DrListContainer extends StatelessWidget {
  const DrListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: secondryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('images/dr.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'drh. Ariyo Hartono',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'General Veterinary',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$125.000',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '2.1 KM',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 40,
            child: Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Handle tapping on the right chevron button
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
